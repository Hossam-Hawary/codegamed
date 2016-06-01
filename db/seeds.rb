# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Admin.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
Level.create!(badge_id:1, order:1)
Level.create!(badge_id:1, order:2)
Level.create!(badge_id:1, order:3)
Level.create!(badge_id:1, order:4)
Level.create!(badge_id:1, order:5)
Level.create!(badge_id:1, order:6)
Mission.create(order:1, score:100, level_id:1, video_url: "https://player.vimeo.com/video/162638502", problem: "

<p>Find the smallest number from the given two integers.</p>

<p><strong>Example</strong></p>

<p>For&nbsp;<code>a = 3</code>&nbsp;and&nbsp;<code>b = 2</code>, the output should be<br />
<code>myMin(a, b) = 2</code>.</p>

<p><strong>Input/Output</strong></p>

<ul>
	<li><strong>[time limit] 3000ms (java)</strong></li>
</ul>

<ul>
	<li>
	<p><strong>[input] integer a</strong></p>

	<p><em>Constraints:</em><br />
	<code>0 &le; a &le; 20</code>.</p>
	</li>
	<li>
	<p><strong>[input] integer b</strong></p>

	<p><em>Constraints:</em><br />
	<code>0 &le; b &le; 20</code>.</p>
	</li>
	<li>
	<p><strong>[output] integer</strong></p>

	<p>Min of&nbsp;<code>a</code>&nbsp;and&nbsp;<code>b</code>.</p>
	</li>
</ul>

", initial_code:"
codeint myMin(int a, int b) {
  if (a > b) {
    return a;
  }
  return b;
}
")
Mission.create(order:2, score:200, level_id:1, video_url: "https://player.vimeo.com/video/164479194?title=0&byline=0&portrait=0",
               problem: "
<p>Given integer&nbsp;<code>n</code>, find&nbsp;<a href='javascript:void(0);' target='_blank' title='Click here to see the definition'>n!</a>.</p>

<p><strong>Example</strong></p>

<p>For&nbsp;<code>n = 5</code>, the output should be<br />
<code>factorial(n) = 120</code>.</p>

<p>Here&nbsp;<code>1 * 2 * 3 * 4 * 5 = 120</code>.</p>

<p><strong>Input/Output</strong></p>

<ul>
	<li><strong>[time limit] 4000ms (js)</strong></li>
</ul>

<ul>
	<li>
	<p><strong>[input] integer n</strong></p>

	<p><em>Constraints:</em><br />
	<code>0 &le; n &le; 10</code>.</p>
	</li>
	<li>
	<p><strong>[output] integer</strong></p>
	</li>
</ul>", initial_code:"
int factorial(int n) {

  if (n == 0) {
    return 1;
  }

  return  ... ;
}
")
TestCase.create!(mission_id:1, input:"myMin(3,2)", output:"2")
TestCase.create!(mission_id:2, input:"factorial(5)", output:"120")
TestCase.create!(mission_id:2, input:"factorial(0)", output:"1")



