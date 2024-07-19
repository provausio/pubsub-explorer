using System.Diagnostics.CodeAnalysis;
using System.Text.RegularExpressions;

namespace PubsubExplorer.Ext;

internal static partial class StringEx
{
    public static bool TryParseRegex(        
        this string? input,
        [NotNull] out Regex regex,
        bool defaultToAll = false)
    {
        regex = MatchAll();

        try
        {
            if (input is null)
            {
                return defaultToAll;
            }

            regex = new Regex(input);
            return true;
        }
        catch
        {
            return defaultToAll;           
        }
    }

    [GeneratedRegex(".*")]
    private static partial Regex MatchAll();
}
