﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace Lifethreadening.DataAccess.API.GeneDTOs
{
    /// <summary>
    /// This class is used to store details about a genome
    /// </summary>
    public class GenomeDetails
    {
        [JsonPropertyName("proteinDescription")]
        public Protein Protein { get; set; }
        public IEnumerable<Gene> Genes { get; set; }
        public Description Sequence { get; set; }
    }
}
