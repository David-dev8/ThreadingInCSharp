﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lifethreadening.DataAccess.API.Genes
{
    public class UniProtResult<T>
    {
        public IEnumerable<T> Results { get; set; }
    }
}
