


def brute_contiguous_subset(set) 

	if set.empty? 
		return nil
	elsif set.length == 1
		return set[0]
	else

	#initialize the best sum to be the value of the first element
	best_sum = set[0]
	current_sum = 0
	best_start = 0
	best_end = 0

	#check the sum of every contiguous subset to see if it beats the best_sum. This will
	#be O(n^2) 
		set.each_with_index do |outer_el, outer_i|
			current_sum = 0
			inner_set = set[outer_i..set.length-1]
			inner_set.each_with_index do |inner_el, inner_i|
				current_sum = current_sum + inner_set[inner_i]
				if current_sum >= best_sum
					best_start = outer_i
					best_end = outer_i + inner_i
					best_sum = current_sum
				end
			end
		end
	end

	return set[best_start..best_end]
end

# p brute_contiguous_subset([1, 2]) 
# p brute_contiguous_subset([0, 1, 2, 3])
# p brute_contiguous_subset([-1])
# p brute_contiguous_subset([-1, 0])
# p brute_contiguous_subset([-1, 0, 1])
# p brute_contiguous_subset([4, -1, 5, 6, -13, 2])

def better_contiguous_subset(set)

	if set.empty?
		return nil
	elsif set.length == 1
		return set[0]
	else

		best_sum = set[0]
		best_start = 0
		best_end = 0
		current_sum = 0

	#loop over the set one time 0(n). For each element, check if that element itself is >= (best_sum plus the current element).
	#If it is, then throw out the best_sum so far and start a new best_sum with the current element as the best_start and best_end.

		set.each_with_index do |el, i|
			current_sum = current_sum + el
			if el > current_sum
				best_start = i
				best_end = i
				best_sum = el
			elsif current_sum >= best_sum
				best_end = i
				best_sum = current_sum
			end
		end
	end

	return set[best_start..best_end]
end

#p better_contiguous_subset([4, -1, 5, 6, -13, 2])

#Explaining my approach: I chose Ruby because it's the langauge I'm most familiar with. First I implemented a brute force solution per the directions.
#I just used two loops to look at every possible subset and then I compared the sums of those subsets. This is an O(n^2) solution. Eh, not so great. In my
#brute force solution, I touch each element once in the outer-loop to mark it as the first-element in a subset, and I also touch each element again each time  I encounter it within a subset
#of an outer element. My dream is to beat O(n^2) so maybe I can look at each element only once ( O(n) ). To do this, is there I way that I can consider, while looking at an element
#to add to an outer element's subset, whether we should ever consider a subset that starts with that element. Yes, there is. If that element is greater than the currently running sum plus the element,
#then any subset starting from that element will have a better sum than the current_sum. 






