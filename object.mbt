///|
impl Show for Object with output(self, logger) {
  match self {
    Null => logger.write_string("null")
    Boolean(b) => logger.write_object(b)
    Integer(n) => logger.write_object(n)
    Real(r) => logger.write_object(r)
    String(s) => output_pdf_string(s, logger)
    Name(n) => output_pdf_name(n, logger)
    Array(elts) => {
      logger.write_char('[')
      match elts {
        [] => ()
        [x] => logger.write_object(x)
        [x, .. xs] => {
          logger.write_object(x)
          for x in xs {
            logger.write_char(' ')
            logger.write_object(x)
          }
        }
      }
      logger.write_char(']')
    }
    Dictionary(entries) => {
      logger.write_string("<<")
      match entries {
        [] => ()
        [(k, v)] => output_pdf_dictionary_key_value(k, v, logger)
        [(k, v), .. xs] => {
          output_pdf_dictionary_key_value(k, v, logger)
          for x in xs {
            let (k, v) = x
            logger.write_string("\t")
            output_pdf_dictionary_key_value(k, v, logger)
          }
        }
      }
      logger.write_string(">>")
    }
    Stream(dict, data) => {
      logger.write_object(dict)
      logger.write_string("\nstream\n")
      logger.write_object(data)
      logger.write_string("\nendstream")
    }
    Indirect(n) => logger.write_string("\{n} 0 R")
  }
}

///|
impl Show for Stream with output(self, logger) {
  logger.write_string(self.inner())
}

///|
fn output_pdf_dictionary_key_value(k : String, v : Object, b : &Logger) -> Unit {
  output_pdf_name(k, b)
  b.write_char(' ')
  b.write_object(v)
}

///|
fn output_pdf_string(s : String, b : &Logger) -> Unit {
  b.write_char('(')
  for x in s {
    match x {
      '(' | ')' | '\\' as c => {
        b.write_char('\\')
        b.write_char(c)
      }
      '\n' => {
        b.write_char('\\')
        b.write_char('n')
      }
      '\r' => {
        b.write_char('\\')
        b.write_char('r')
      }
      '\t' => {
        b.write_char('\\')
        b.write_char('t')
      }
      '\b' => {
        b.write_char('\\')
        b.write_char('b')
      }
      '\u000c' => {
        b.write_char('\\')
        b.write_char('f')
      }
      c => b.write_char(c)
    }
  }
  b.write_char(')')
}

///|
fn output_pdf_name(n : String, b : &Logger) -> Unit {
  if needs_processing(n) {
    if n == "" || n.get_char(0).unwrap() != '/' {
      println("warning: bad name")
      b.write_char('/')
    } else {
      b.write_char('/')
      output_pdf_name_inner(n, b)
    }
  } else {
    b.write_string(n)
  }
}

///|
fn needs_processing(s : String) -> Bool {
  let l = s.length()
  if l < 2 {
    false
  } else {
    needs_processing_inner(s, 1, l)
  }
}

///|
fn needs_processing_inner(s : String, p : Int, l : Int) -> Bool {
  p <= l - 1 &&
  (match s.get_char(p).unwrap() {
    x if x < '\u0021' || x > '\u007e' || is_delimiter(x) || x == '#' => true
    _ => needs_processing_inner(s, p + 1, l)
  })
}

///|
fn is_delimiter(x : Char) -> Bool {
  match x {
    '(' | ')' | '<' | '>' | '[' | ']' | '{' | '}' | '/' | '%' => true
    _ => false
  }
}

///|
const HEX_DIGITS = "0123456789ABCDEF"

///|
fn hexchar(x : Int) -> Char {
  HEX_DIGITS.get_char(x).unwrap()
}

///|
fn output_pdf_name_inner(n : String, b : &Logger) -> Unit {
  for ch in n {
    match ch {
      '\u0000' => {
        println("Warning: name \{n} contains the null character\n")
        b.write_string("#00")
      }
      h if h < '\u0021' || h > '\u007e' || is_delimiter(h) || h == '#' => {
        b.write_char('#')
        b.write_char(hexchar(h.to_int() / 16))
        b.write_char(hexchar(h.to_int() % 16))
      }
      h => b.write_char(h)
    }
  }
}

///|
test {
  let p = Dictionary([
    ("/Type", Name("/Pages")),
    ("/Kids", Array([Indirect(4)])),
    ("/Count", Integer(1)),
  ])
  inspect(p, content="<</Type /Pages\u{9}/Kids [4 0 R]\u{9}/Count 1>>")
  let tm : TransformMatrix = TransformMatrix::{
    a: 1,
    b: 0,
    c: 0,
    d: 1,
    e: 50,
    f: 770,
  }
  let op1 = Op_cm(tm)
  let op2 = Op_BT
  let op3 = Op_Tf("/F0", 36)
  let op4 = Op_Tj("Hello, World!")
  let op5 = Op_ET
  let ops = [op1, op2, op3, op4, op5]
  let ops_s = ops |> ops_to_str
  let len = ops_s.length()
  let stm = Object::Stream(Dictionary([("/Length", Integer(len))]), ops_s)
  inspect(
    stm,
    content=(
      #|<</Length 51>>
      #|stream
      #| 1 0 0 1 50 770 cm BT /F0 36 Tf(Hello, World!)Tj ET
      #|endstream
    ),
  )
}

///|
test (t : @test.T) {
  let tm : TransformMatrix = TransformMatrix::{
    a: 1,
    b: 0,
    c: 0,
    d: 1,
    e: 50,
    f: 770,
  }
  let op1 = Op_cm(tm)
  let op2 = Op_BT
  let op3 = Op_Tf("/F0", 36)
  let op4 = Op_Tj("Hello, World!")
  let op5 = Op_ET
  let ops = [op1, op2, op3, op4, op5]
  let ops_s = ops |> ops_to_str
  let len = ops_s.length()

  // 1 0 obj
  let stm = Object::Stream(Dictionary([("/Length", Integer(len))]), ops_s)
  // 2 0 obj 
  let page_root = Dictionary([
    ("/Type", Name("/Pages")),
    ("/Kids", Array([Indirect(4)])),
    ("/Count", Integer(1)),
  ])
  // 3 0 obj
  let doc_catalog = Dictionary([
    ("/Type", Name("/Catalog")),
    ("/Pages", Indirect(2)),
  ])

  // 4 0 obj 
  let page_object = Dictionary([
    ("/Type", Name("/Page")),
    ("/Contents", Indirect(1)),
    ("/Parent", Indirect(2)),
    (
      "/MediaBox",
      Array([Integer(0), Integer(0), Real(595.2765), Real(841.89105)]),
    ),
    (
      "/Resources",
      Dictionary([
        (
          "/Font",
          Dictionary([
            (
              "/F0",
              Dictionary([
                ("/Type", Name("/Font")),
                ("/Subtype", Name("/Type1")),
                ("/BaseFont", Name("/Times-Italic")),
              ]),
            ),
          ]),
        ),
      ]),
    ),
  ])
  inspect(
    stm,
    content=(
      #|<</Length 51>>
      #|stream
      #| 1 0 0 1 50 770 cm BT /F0 36 Tf(Hello, World!)Tj ET
      #|endstream
    ),
  )
  inspect(page_root, content="<</Type /Pages\u{9}/Kids [4 0 R]\u{9}/Count 1>>")
  inspect(doc_catalog, content="<</Type /Catalog\u{9}/Pages 2 0 R>>")
  inspect(
    page_object,
    content="<</Type /Page\u{9}/Contents 1 0 R\u{9}/Parent 2 0 R\u{9}/MediaBox [0 0 595.2765 841.89105]\u{9}/Resources <</Font <</F0 <</Type /Font\u{9}/Subtype /Type1\u{9}/BaseFont /Times-Italic>>>>>>>>",
  )
  let pdf = Pdf::{
    major: 1,
    minor: 4,
    root: 3,
    trailer: Dictionary([("/Size", Integer(5)), ("/Root", Indirect(3))]),
    objects: [stm, page_root, doc_catalog, page_object],
  }
  let b = StringBuilder::new(size_hint=512)
  output_pdf(pdf, b)
  let s = b.to_string()
  t.write(s)
  t.snapshot(filename="hello.pdf")
}

///|
fn ops_to_str(xs : Array[GraphicsOp]) -> String {
  let b = StringBuilder::new(size_hint=80)
  for x in xs {
    b.write_object(x)
  }
  b.to_string()
}

///|
fn output_pdf_header(pdf : Pdf, b : &Logger) -> Unit {
  b.write_string("%PDF-\{pdf.major}.\{pdf.minor}\n")
  // TODO
  b.write_string("%\u{80}\u{81}\u{82}\u{83}\n")
}

///|
fn output_pdf_obj(obj : Object, n : Int, b : &Logger) -> Unit {
  b.write_string("\{n} 0 obj\n")
  b.write_object(obj)
  b.write_string("\nendobj\n")
}

///|
fn output_pdf_xrefs(xrefs : Array[Int], b : &Logger) -> Unit {
  b.write_string("xref\n")
  b.write_string("0 ")
  b.write_string("\{xrefs.length() + 1}\n")
  b.write_string("0000000000 65535 f \n")
  for xref in xrefs {
    output_pdf_xref(xref, b)
  }
}

///|
fn output_pdf_xref(n : Int, b : &Logger) -> Unit {
  let s = n.to_string()
  let l = s.length()
  let width = 10
  for _ in 0..<(width - l) {
    b.write_string("0")
  }
  b.write_string(s)
  b.write_string(" 00000 n \n")
}

///|
fn output_pdf_trailer(trailer_dict : Object, b : &Logger) -> Unit {
  b.write_string("trailer\n")
  b.write_object(trailer_dict)
}

///|
fn output_pdf_startxref(offset : Int, b : &Logger) -> Unit {
  b.write_string("startxref\n")
  b.write_object(offset)
  b.write_string("\n%%EOF\n")
}

///|
fn output_pdf(pdf : Pdf, b : &Logger) -> Unit {
  output_pdf_header(pdf, b)
  // output pdf body 
  for n, obj in pdf.objects.iter2() {
    output_pdf_obj(obj, n + 1, b)
  }
  output_pdf_xrefs(pdf.objects.mapi((n, _) => n + 1), b)
  output_pdf_trailer(pdf.trailer, b)
  output_pdf_startxref(0, b)
}
