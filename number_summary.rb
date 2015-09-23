# @author Tim Padjen <tpadjen@gmail.com>
class NumberSummary
	
	class << self

		def min(a)
			puts "min: #{a.min}"
		end

		def max(a)
			puts "max: #{a.max}"	
		end

		def average(a)
			total = 0
			average = 0
			a.each do |element|
			total += element.to_f
		end
			average = total / a.length
			puts "mean: #{average}"
		end

	def median(a)
		sorted = a.sort
		length = a.length
		median = 0

		if length%2 == 0
			first = sorted[length/2 - 1]
			second = sorted[length/2] 

			median = (first + second) / 2
		else
			median = sorted[(length-1)/2]
		end
			puts "median: #{median}"
		end

	def q1(array)
   arr = array.sort
   length = arr.size
   quart = (length/4.0).floor
   fraction = 1-((length/4.0)-quart)
   new_arr = arr[quart..-(quart + 1)]
   (fraction*(new_arr[0]+new_arr[-1]) + new_arr[1..-2].inject(:+))/(length/2.0)
	end


	def quartile(arr,n=3)
  	arr.sort!
  	split = median_split arr
  	case n
  	when 1
    	median split[0]
  	when 2
    	median arr
  	when 3
    	median split[1]
  end

  def mode(a)
		var = 0
		mode = 0
		prevVar = 0
		a.each do |i|
			a.each do |n|
				if i == n
					var += 1
					mode = n if var > prevVar
					prevVar = var
				end
			end
			var = 0
		end
		puts "mode: #{mode}"
	end

	def standard_deviation
    return Math.sqrt(self.sample_variance)
  end

  #Testing it:
  #a = [ 20, 23, 23, 24, 25, 22, 12, 21, 29 ]
	#a.standard_deviation  
	# => 4.594682917363407

	def mean_and_standard_deviation(array)
  	m = mean(array)
  	variance = array.inject(0) { |variance, x| variance += (x - m) ** 2 }
  	return m, Math.sqrt(variance/(array.size-1))
	end

end
end
end

#Order should be:
#min: -9.45
#max: 4.99
#mean: -2.4
#median: -3.9
#q1: -5.5
#q3: 1.6
#mode: [-4.73, 1.59]
#sigma: 4.8