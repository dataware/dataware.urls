<div class="urls">

</div>

<script type="text/javascript" src="./static/d3cloud/d3.js"></script>
<script type="text/javascript" src="./static/d3cloud/d3.layout.cloud.js"></script>

<script>
  var fill = d3.scale.category20();

  d3.layout.cloud().size([1500, 600])
      .words({{!data}}.map(function(d) {
        return {text: d.url, size: 20 * d.requests};
      }))
      .padding(1)
      .rotate(function() { return 0 })
      .font("Impact")
      .fontSize(function(d) { return d.size; })
      .on("end", draw)
      .start();

  function draw(words) {
    d3.select(".urls").append("svg")
        .attr("width", 1500)
        .attr("height", 600)
      .append("g")
        .attr("transform", "translate(150,150)")
      .selectAll("text")
        .data(words)
      .enter().append("text")
        .style("font-size", function(d) { return d.size + "px"; })
        .style("font-family", "Impact")
        .style("fill", function(d, i) { return fill(i); })
        .attr("text-anchor", "middle")
        .attr("transform", function(d) {
          return "translate(" + [d.x, d.y] + ")rotate(" + d.rotate + ")";
        })
        .text(function(d) { return d.text; });
  }
</script>
