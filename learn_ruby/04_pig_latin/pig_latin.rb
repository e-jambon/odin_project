def translate sentence
  (sentence.split.map do |word|
    # L'astuce ici : les $ sont remplis après par chaque bout de l'expression régulière.
    # cf : http://ruby-doc.org/core-2.2.0/Regexp.html#method-i-3D-7E   
    word =~ /^   
    ( 
      [^aeiouyq]*  
      (qu)?
    )
    (.*)
    $/x      
    $3 + $1 + "ay"
  end).join(" ")
end