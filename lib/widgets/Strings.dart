class CapitalizeString {
  String capitalizeString(String name) {
    if (name.isEmpty) {
      return "";
    }

    // Split the string by spaces to get each word
    List<String> words = name.split(" ");

    // Capitalize the first letter of each word
    List<String> capitalizedWords = words.map((word) {
      if (word.isNotEmpty) {
        return "${word[0].toUpperCase()}${word.substring(1).toLowerCase()}";
      } else {
        return word;
      }
    }).toList();

    // Join the words back together with spaces
    return capitalizedWords.join(" ");
  }
}
