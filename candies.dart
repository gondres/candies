int candies(List<int> arr, int n) {
  List<int> candiesCount = List<int>.filled(n, 1);

  for (int i = 1; i < n; i++) {
    if (arr[i] > arr[i - 1]) {
      candiesCount[i] = candiesCount[i - 1] + 1;
    }
  }

  for (int i = n - 2; i >= 0; i--) {
    if (arr[i] > arr[i + 1] && candiesCount[i] <= candiesCount[i + 1]) {
      candiesCount[i] = candiesCount[i + 1] + 1;
    }
  }

  int totalCandies = candiesCount.reduce((a, b) => a + b);

  return totalCandies;
}

void main() {
  List<int> ratings = [1, 2, 2];
  int n = ratings.length;
  int result = candies(ratings, n);
  print(result);
}
