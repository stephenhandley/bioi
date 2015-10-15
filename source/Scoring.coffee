module.exports = {
  entropy : (distribution)->
    log2 = (n)->
      Math.log(n) / Math.log(2)

    -1 * (distribution.map((n)->
      if (n is 0)
        0
      else
        n * log2(n)
    ).reduce((a, b)->
      a + b
    ))
  
}
