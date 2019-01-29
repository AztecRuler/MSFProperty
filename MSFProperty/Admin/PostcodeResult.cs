﻿using System.Globalization;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;

namespace MSFProperty.Admin
{
    public partial class PostcodeResult
    {
        [JsonProperty("status")]
        public long Status { get; set; }

        [JsonProperty("result")]
        public Result Result { get; set; }
    }

    public class Result
    {
        [JsonProperty("postcode")]
        public string Postcode { get; set; }

        [JsonProperty("quality")]
        public long Quality { get; set; }

        [JsonProperty("eastings")]
        public long Eastings { get; set; }

        [JsonProperty("northings")]
        public long Northings { get; set; }

        [JsonProperty("country")]
        public string Country { get; set; }

        [JsonProperty("nhs_ha")]
        public string NhsHa { get; set; }

        [JsonProperty("longitude")]
        public double Longitude { get; set; }

        [JsonProperty("latitude")]
        public double Latitude { get; set; }

        [JsonProperty("european_electoral_region")]
        public string EuropeanElectoralRegion { get; set; }

        [JsonProperty("primary_care_trust")]
        public string PrimaryCareTrust { get; set; }

        [JsonProperty("region")]
        public object Region { get; set; }

        [JsonProperty("lsoa")]
        public string Lsoa { get; set; }

        [JsonProperty("msoa")]
        public string Msoa { get; set; }

        [JsonProperty("incode")]
        public string Incode { get; set; }

        [JsonProperty("outcode")]
        public string Outcode { get; set; }

        [JsonProperty("parliamentary_constituency")]
        public string ParliamentaryConstituency { get; set; }

        [JsonProperty("admin_district")]
        public string AdminDistrict { get; set; }

        [JsonProperty("parish")]
        public object Parish { get; set; }

        [JsonProperty("admin_county")]
        public object AdminCounty { get; set; }

        [JsonProperty("admin_ward")]
        public string AdminWard { get; set; }

        [JsonProperty("ced")]
        public object Ced { get; set; }

        [JsonProperty("ccg")]
        public string Ccg { get; set; }

        [JsonProperty("nuts")]
        public string Nuts { get; set; }

        [JsonProperty("codes")]
        public Codes Codes { get; set; }
    }

    public class Codes
    {
        [JsonProperty("admin_district")]
        public string AdminDistrict { get; set; }

        [JsonProperty("admin_county")]
        public string AdminCounty { get; set; }

        [JsonProperty("admin_ward")]
        public string AdminWard { get; set; }

        [JsonProperty("parish")]
        public string Parish { get; set; }

        [JsonProperty("parliamentary_constituency")]
        public string ParliamentaryConstituency { get; set; }

        [JsonProperty("ccg")]
        public string Ccg { get; set; }

        [JsonProperty("ced")]
        public string Ced { get; set; }

        [JsonProperty("nuts")]
        public string Nuts { get; set; }
    }

    public partial class PostcodeResult
    {
        public static PostcodeResult FromJson(string json) => JsonConvert.DeserializeObject<PostcodeResult>(json, Converter.Settings);
    }

    public static class Serialize
    {
        public static string ToJson(this PostcodeResult self) => JsonConvert.SerializeObject(self, Converter.Settings);
    }

    internal static class Converter
    {
        public static readonly JsonSerializerSettings Settings = new JsonSerializerSettings
        {
            MetadataPropertyHandling = MetadataPropertyHandling.Ignore,
            DateParseHandling = DateParseHandling.None,
            Converters =
            {
                new IsoDateTimeConverter { DateTimeStyles = DateTimeStyles.AssumeUniversal }
            }
        };
    }
}

