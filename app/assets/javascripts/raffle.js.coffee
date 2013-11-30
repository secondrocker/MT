app=angular.module("Raffle",["ngResource"])

app.factory "Post",($resource) ->
	$resource("/posts/:id.json",{id:"@id"},{update:{method:"put"}})
	
@PostCtrl = ($scope,Post) ->
	$scope.posts = Post.query()
	
	$scope.addNewPost= ->
		post=Post.save($scope.newPost)
		$scope.posts.push post 
		$scope.newPost={}
		
	$scope.drawWinner = ->
		pool = []
		angular.forEach $scope.posts , (post)->
			pool.push post if !post.winner
		if pool.length >0
			post = pool[Math.floor(Math.random()*pool.length)]
			post.winner = true
			post.$update()
			$scope.lastWinner = post