﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Lifethreadening.DataAccess
{
    public interface IGeneReader
    {
        Task<string> GetRandomGene();
        Task<IEnumerable<string>> GetRandomProteins(int amount);
    }
}