﻿using Lifethreadening.DataAccess.API.GeneDTOs;
using Lifethreadening.ExtensionMethods;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace Lifethreadening.DataAccess.API
{
    // TODO initialize? backup?
    public class APIGeneReader : APICaller, IGeneReader
    {
        private const string GENE_API_BASE_URL = "https://rest.uniprot.org/uniprotkb/";
        private const string API_QUERY = "(organism_id%3A9606)";
        private static readonly string[] FIELDS_TO_SELECT = new string[] { "protein_name", "gene_names", "sequence" };

        private Queue<GenomeDetails> _cache = new Queue<GenomeDetails>();
        // For pagination
        private string _nextPage;
        private const int MINIMUM_CACHE_AMOUNT = 30;

        public async Task<string> GetRandomGene()
        {
            await MakeSureToHaveEnough();
            return _cache.Dequeue().Genes.First().Name.Value;
        }

        public async Task<IEnumerable<string>> GetRandomProteins(int amount)
        {
            await MakeSureToHaveEnough(amount);
            return _cache.DequeueMultiple(amount).Select(genomeDetails => genomeDetails.Protein.SubmissionNames.First().FullName.Value).ToList();
        }

        private async Task MakeSureToHaveEnough(int amount = 1)
        {
            if(_cache.Count < amount)
            {
                await RetrieveNextBatch(Math.Max(MINIMUM_CACHE_AMOUNT, amount));
            }
        }

        private async Task RetrieveNextBatch(int amount)
        {
            Dictionary<string, object> queryParameters = new Dictionary<string, object>()
            {
                {"query", API_QUERY},
                {"size", amount },
                {"fields", string.Join(",", FIELDS_TO_SELECT) },
            };
            if(_nextPage != null)
            {
                queryParameters.Add("cursor", _nextPage);
            }

            var result = await _apiHandler.Fetch<UniProtResult<GenomeDetails>>(
                GENE_API_BASE_URL + "search",
                queryParameters,
                new string[] { "link" }
            );
            _nextPage = result.Headers["link"];
            _cache.EnqueueMultiple(result.Value.Results);
        }
    }
}
