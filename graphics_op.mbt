///|
impl Show for GraphicsOp with output(self, logger) {
  match self {
    Op_w(w) => {
      logger.write_char(' ')
      logger.write_object(w)
      logger.write_char(' ')
      logger.write_string("w")
    }
    Op_J(j) => {
      logger.write_char(' ')
      logger.write_object(j)
      logger.write_char(' ')
      logger.write_string("J")
    }
    Op_j(j) => {
      logger.write_char(' ')
      logger.write_object(j)
      logger.write_char(' ')
      logger.write_string("j")
    }
    Op_M(m) => {
      logger.write_char(' ')
      logger.write_object(m)
      logger.write_char(' ')
      logger.write_string("M")
    }
    Op_d(fl, y) => {
      logger.write_char(' ')
      logger.write_object(fl.iter())
      logger.write_char(' ')
      logger.write_object(y)
      logger.write_char(' ')
      logger.write_string("d")
    }
    Op_ri(s) => {
      logger.write_char(' ')
      logger.write_string(s)
      logger.write_char(' ')
      logger.write_string("ri")
    }
    Op_i(i) => {
      logger.write_char(' ')
      logger.write_object(i)
      logger.write_char(' ')
      logger.write_string("i")
    }
    Op_gs(s) => {
      logger.write_char(' ')
      logger.write_string(s)
      logger.write_char(' ')
      logger.write_string("gs")
    }
    Op_q => {
      logger.write_char(' ')
      logger.write_string("q")
    }
    Op_Q => {
      logger.write_char(' ')
      logger.write_string("Q")
    }
    Op_cm(t) => {
      logger.write_char(' ')
      logger.write_object(t.a)
      logger.write_char(' ')
      logger.write_object(t.b)
      logger.write_char(' ')
      logger.write_object(t.c)
      logger.write_char(' ')
      logger.write_object(t.d)
      logger.write_char(' ')
      logger.write_object(t.e)
      logger.write_char(' ')
      logger.write_object(t.f)
      logger.write_char(' ')
      logger.write_string("cm")
    }
    Op_m(a, b) => {
      logger.write_char(' ')
      logger.write_object(a)
      logger.write_char(' ')
      logger.write_object(b)
      logger.write_char(' ')
      logger.write_string("m")
    }
    Op_l(a, b) => {
      logger.write_char(' ')
      logger.write_object(a)
      logger.write_char(' ')
      logger.write_object(b)
      logger.write_char(' ')
      logger.write_string("l")
    }
    Op_c(a, b, c, d, e, k) => {
      logger.write_char(' ')
      logger.write_object(a)
      logger.write_char(' ')
      logger.write_object(b)
      logger.write_char(' ')
      logger.write_object(c)
      logger.write_char(' ')
      logger.write_object(d)
      logger.write_char(' ')
      logger.write_object(e)
      logger.write_char(' ')
      logger.write_object(k)
      logger.write_char(' ')
      logger.write_string("c")
    }
    Op_v(a, b, c, d) => {
      logger.write_char(' ')
      logger.write_object(a)
      logger.write_char(' ')
      logger.write_object(b)
      logger.write_char(' ')
      logger.write_object(c)
      logger.write_char(' ')
      logger.write_object(d)
      logger.write_char(' ')
      logger.write_string("v")
    }
    Op_y(a, b, c, d) => {
      logger.write_char(' ')
      logger.write_object(a)
      logger.write_char(' ')
      logger.write_object(b)
      logger.write_char(' ')
      logger.write_object(c)
      logger.write_char(' ')
      logger.write_object(d)
      logger.write_char(' ')
      logger.write_string("y")
    }
    Op_h => {
      logger.write_char(' ')
      logger.write_string("h")
    }
    Op_re(a, b, c, d) => {
      logger.write_char(' ')
      logger.write_object(a)
      logger.write_char(' ')
      logger.write_object(b)
      logger.write_char(' ')
      logger.write_object(c)
      logger.write_char(' ')
      logger.write_object(d)
      logger.write_char(' ')
      logger.write_string("re")
    }
    Op_S => {
      logger.write_char(' ')
      logger.write_string("S")
    }
    Op_s => {
      logger.write_char(' ')
      logger.write_string("s")
    }
    Op_f => {
      logger.write_char(' ')
      logger.write_string("f")
    }
    Op_F => {
      logger.write_char(' ')
      logger.write_string("F")
    }
    Op_f_star => {
      logger.write_char(' ')
      logger.write_string("f*")
    }
    Op_B => {
      logger.write_char(' ')
      logger.write_string("B")
    }
    Op_B_star => {
      logger.write_char(' ')
      logger.write_string("B*")
    }
    Op_b => {
      logger.write_char(' ')
      logger.write_string("b")
    }
    Op_b_star => {
      logger.write_char(' ')
      logger.write_string("b*")
    }
    Op_n => {
      logger.write_char(' ')
      logger.write_string("n")
    }
    Op_W => {
      logger.write_char(' ')
      logger.write_string("W")
    }
    Op_W_star => {
      logger.write_char(' ')
      logger.write_string("W*")
    }
    Op_BT => {
      logger.write_char(' ')
      logger.write_string("BT")
    }
    Op_ET => {
      logger.write_char(' ')
      logger.write_string("ET")
    }
    Op_Tc(c) => {
      logger.write_char(' ')
      logger.write_object(c)
      logger.write_char(' ')
      logger.write_string("Tc")
    }
    Op_Tw(w) => {
      logger.write_char(' ')
      logger.write_object(w)
      logger.write_char(' ')
      logger.write_string("Tw")
    }
    Op_Tz(z) => {
      logger.write_char(' ')
      logger.write_object(z)
      logger.write_char(' ')
      logger.write_string("Tz")
    }
    Op_TL(l) => {
      logger.write_char(' ')
      logger.write_object(l)
      logger.write_char(' ')
      logger.write_string("TL")
    }
    Op_Tf(k, s) => {
      logger.write_char(' ')
      logger.write_string(k)
      logger.write_char(' ')
      logger.write_object(s)
      logger.write_char(' ')
      logger.write_string("Tf")
    }
    Op_Tr(i) => {
      logger.write_char(' ')
      logger.write_object(i)
      logger.write_char(' ')
      logger.write_string("Tr")
    }
    Op_Ts(r) => {
      logger.write_char(' ')
      logger.write_object(r)
      logger.write_char(' ')
      logger.write_string("Ts")
    }
    Op_Td(k, k_) => {
      logger.write_char(' ')
      logger.write_object(k)
      logger.write_char(' ')
      logger.write_object(k_)
      logger.write_char(' ')
      logger.write_string("Td")
    }
    Op_TD(k, k_) => {
      logger.write_char(' ')
      logger.write_object(k)
      logger.write_char(' ')
      logger.write_object(k_)
      logger.write_char(' ')
      logger.write_string("TD")
    }
    Op_Tm(t) => {
      logger.write_char(' ')
      logger.write_object(t.a)
      logger.write_char(' ')
      logger.write_object(t.b)
      logger.write_char(' ')
      logger.write_object(t.c)
      logger.write_char(' ')
      logger.write_object(t.d)
      logger.write_char(' ')
      logger.write_object(t.e)
      logger.write_char(' ')
      logger.write_object(t.f)
      logger.write_char(' ')
      logger.write_string("Tm")
    }
    Op_T_star => {
      logger.write_char(' ')
      logger.write_string("T*")
    }
    Op_Tj(s) => {
      logger.write_char('(')
      logger.write_string(s)
      logger.write_char(')')
      logger.write_string("Tj")
    }
    Op_TJ(obj) => {
      logger.write_char(' ')
      logger.write_object(obj)
      logger.write_char(' ')
      logger.write_string("TJ")
    }
    Op_single_quote(s) => {
      logger.write_char(' ')
      logger.write_string(s)
      logger.write_char(' ')
      logger.write_string("'")
    }
    Op_double_quote(k, k_, s) => {
      logger.write_char(' ')
      logger.write_object(k)
      logger.write_char(' ')
      logger.write_object(k_)
      logger.write_char(' ')
      logger.write_string(s)
      logger.write_char(' ')
      logger.write_string("\"")
    }
    Op_d0(k, k_) => {
      logger.write_char(' ')
      logger.write_object(k)
      logger.write_char(' ')
      logger.write_object(k_)
      logger.write_char(' ')
      logger.write_string("d0")
    }
    Op_d1(a, b, c, d, e, k) => {
      logger.write_char(' ')
      logger.write_object(a)
      logger.write_char(' ')
      logger.write_object(b)
      logger.write_char(' ')
      logger.write_object(c)
      logger.write_char(' ')
      logger.write_object(d)
      logger.write_char(' ')
      logger.write_object(e)
      logger.write_char(' ')
      logger.write_object(k)
      logger.write_char(' ')
      logger.write_string("d1")
    }
    Op_CS(s) => {
      logger.write_char(' ')
      logger.write_string(s)
      logger.write_char(' ')
      logger.write_string("CS")
    }
    Op_cs(s) => {
      logger.write_char(' ')
      logger.write_string(s)
      logger.write_char(' ')
      logger.write_string("cs")
    }
    Op_SC(fs) => {
      for f in fs {
        logger.write_char(' ')
        logger.write_object(f)
      }
      logger.write_char(' ')
      logger.write_string("SC")
    }
    Op_sc(fs) => {
      for f in fs {
        logger.write_char(' ')
        logger.write_object(f)
      }
      logger.write_char(' ')
      logger.write_string("sc")
    }
    Op_SCN(fs) => {
      for f in fs {
        logger.write_char(' ')
        logger.write_object(f)
      }
      logger.write_char(' ')
      logger.write_string("SCN")
    }
    Op_scn(fs) => {
      for f in fs {
        logger.write_char(' ')
        logger.write_object(f)
      }
      logger.write_char(' ')
      logger.write_string("scn")
    }
    Op_scnName(s, fs) => {
      for f in fs {
        logger.write_char(' ')
        logger.write_object(f)
      }
      logger.write_char(' ')
      logger.write_string(s)
      logger.write_char(' ')
      logger.write_string("scn")
    }
    Op_SCNName(s, fs) => {
      for f in fs {
        logger.write_char(' ')
        logger.write_object(f)
      }
      logger.write_char(' ')
      logger.write_string(s)
      logger.write_char(' ')
      logger.write_string("SCN")
    }
    Op_G(k) => {
      logger.write_char(' ')
      logger.write_object(k)
      logger.write_char(' ')
      logger.write_string("G")
    }
    Op_g(k) => {
      logger.write_char(' ')
      logger.write_object(k)
      logger.write_char(' ')
      logger.write_string("g")
    }
    Op_RG(r, g, b) => {
      logger.write_char(' ')
      logger.write_object(r)
      logger.write_char(' ')
      logger.write_object(g)
      logger.write_char(' ')
      logger.write_object(b)
      logger.write_char(' ')
      logger.write_string("RG")
    }
    Op_rg(r, g, b) => {
      logger.write_char(' ')
      logger.write_object(r)
      logger.write_char(' ')
      logger.write_object(g)
      logger.write_char(' ')
      logger.write_object(b)
      logger.write_char(' ')
      logger.write_string("rg")
    }
    Op_K(c, m, y, k) => {
      logger.write_char(' ')
      logger.write_object(c)
      logger.write_char(' ')
      logger.write_object(m)
      logger.write_char(' ')
      logger.write_object(y)
      logger.write_char(' ')
      logger.write_object(k)
      logger.write_char(' ')
      logger.write_string("K")
    }
    Op_k(c, m, y, k) => {
      logger.write_char(' ')
      logger.write_object(c)
      logger.write_char(' ')
      logger.write_object(m)
      logger.write_char(' ')
      logger.write_object(y)
      logger.write_char(' ')
      logger.write_object(k)
      logger.write_char(' ')
      logger.write_string("k")
    }
    Op_sh(s) => {
      logger.write_char(' ')
      logger.write_string(s)
      logger.write_char(' ')
      logger.write_string("sh")
    }
    InlineImage(dict, dp, data) => abort("TODO")
    Op_Do(s) => {
      logger.write_char(' ')
      logger.write_string(s)
      logger.write_char(' ')
      logger.write_string("Do")
    }
    Op_MP(s) => {
      logger.write_char(' ')
      logger.write_string(s)
      logger.write_char(' ')
      logger.write_string("MP")
    }
    Op_DP(s, o) => {
      logger.write_char(' ')
      logger.write_string(s)
      logger.write_char(' ')
      logger.write_object(o)
      logger.write_char(' ')
      logger.write_string("DP")
    }
    Op_BMC(s) => {
      logger.write_char(' ')
      logger.write_string(s)
      logger.write_char(' ')
      logger.write_string("BMC")
    }
    Op_BDC(s, obj) => {
      logger.write_char(' ')
      logger.write_string(s)
      logger.write_char(' ')
      logger.write_object(obj)
      logger.write_char(' ')
      logger.write_string("BDC")
    }
    Op_EMC => {
      logger.write_char(' ')
      logger.write_string("EMC")
    }
    Op_BX => {
      logger.write_char(' ')
      logger.write_string("BX")
    }
    OP_EX => {
      logger.write_char(' ')
      logger.write_string("EX")
    }
    Op_Unknown(_) => ()
    Op_Comment(s) => {
      logger.write_char(' ')
      logger.write_string("%")
      logger.write_char(' ')
      logger.write_string(s)
      logger.write_char(' ')
      logger.write_string("\n")
    }
  }
}
