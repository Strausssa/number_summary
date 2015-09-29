# @author Sam Strauss <strausssa@s.dcsdk12.org>
class NumberSummary
	
	class << self

		def return_array(fil)
			file = File.open(fil, "r")
			array = file.read
			array = array.split ","
			# arra = array.to_i
			(0...array.length).each do |n|
				array[n] = array[n].to_f
			end
			array.sort
		end

		def max(array)
			array.max
		end

		def min(array)
			array.min
		end


		def mean(array)
			sum = 0.0
			(0...array.length).each do |n|
				sum += array[n]
			end
			(sum / array.length).round(1)
		end

		def median(array)
  		sorted = array.sort
  		len = sorted.length
  		return (sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0
		end

		def mode(array)
			max = 0
			array_uni = array.uniq
			array_count = []
			array_final = []
			(0...array_uni.length).each do |n|
				array_count.push(0)
			end
			(0...array.length).each do |n|
				(0...array_uni.length).each do |x|
					if array_uni[x] == array[n]
						array_count[x] += 1
					end
				end
			end
			max = array_count.max
			(0...array_count.length).each do |n|
				if array_count[n] == max
					array_final.push(array_uni[n])
				end
			end
			array_final.sort
		end

		def q1(array)
			if array.length % 2 == 0 
				array_final = array[0..(array.length/2 - 1)]
			else
				array_final = array[0..(array.length/2)]
			end	
			
			median(array_final).round(1)
		end

		def q3(array)
			if array.length % 2 == 0
				array_final = array[(array.length/2)...array.length]
			else
				array_final = array[(array.length/2 + 1)...array.length]
			end
			
			median(array_final).round(1)
		end

		def sigma(array)
			variation = mean(array).round(1)
			array_dif = []
			(0...array.length).each do |n|
				array_dif.push(((array[n] - variation)**2).round(1))
			end	
			Math.sqrt(mean(array_dif))
		end

		def summarize(filename)
			array = return_array(filename)
			return"""
			Number Summary:
			min: #{min(array)}
			max: #{max(array)}
			mean: #{mean(array)}
			median: #{median(array)}
			q1: #{q1(array)}
			q3: #{q3(array)}
			mode: #{mode(array)}
			sigma: #{sigma(array)}
			"""
		end
	end
end
#----------------------------------------------------------------------------------------------#
#Order should be:
#min: -9.45
#max: 4.99
#mean: -2.4
#median: -3.9
#q1: -5.5
#q3: 1.6
#mode: [-4.73, 1.59]
#sigma: 4.8