﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Be
{
   public class Fact_AlicIva
    {
        public int Id { get; set; }
        public string BaseImp { get; set; }
        public string Importe { get; set; }

    }

    public class Fact_Tributo
    {
        public int Id { get; set; }
        public string Desc { get; set; }
        public string Alic { get; set; }
        public string BaseImp { get; set; }
        public string Importe { get; set; }

    }
}
