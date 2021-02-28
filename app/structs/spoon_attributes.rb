SpoonAttributes = Struct.new(:a, :b, keyword_init: true) do
  def concatter
    "#{a}_#{b}"
  end
end
