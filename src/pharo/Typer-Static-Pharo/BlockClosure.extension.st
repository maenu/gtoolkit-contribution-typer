Extension { #name : #BlockClosure }

{ #category : #'*Typer-Static-Pharo' }
BlockClosure class >> typAsType [
	^ TypParametricType new
		type: super typAsType asNonParametricType;
		parameters: {TypUnknownType instance};
		yourself
]

{ #category : #'*Typer-Static-Pharo' }
BlockClosure class >> typStaInstanceMethodResolvers [
	| resolvers |
	resolvers := OrderedCollection new.
	resolvers
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #cull:;
				argumentTypes: [ :r :i :a | a key parameters at: i ];
				resultType: [ :r :a | a key parameters last ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #cull:cull:;
				argumentTypes: [ :r :i :a | a key parameters at: i ];
				resultType: [ :r :a | a key parameters last ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #cull:cull:cull:;
				argumentTypes: [ :r :i :a | a key parameters at: i ];
				resultType: [ :r :a | a key parameters last ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #cull:cull:cull:cull:;
				argumentTypes: [ :r :i :a | a key parameters at: i ];
				resultType: [ :r :a | a key parameters last ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #value:;
				argumentTypes: [ :r :i :a | a key parameters at: i ];
				resultType: [ :r :a | a key parameters last ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #value:value:;
				argumentTypes: [ :r :i :a | a key parameters at: i ];
				resultType: [ :r :a | a key parameters last ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #value:value:value:;
				argumentTypes: [ :r :i :a | a key parameters at: i ];
				resultType: [ :r :a | a key parameters last ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #value:value:value:value:;
				argumentTypes: [ :r :i :a | a key parameters at: i ];
				resultType: [ :r :a | a key parameters last ];
				yourself).
	resolvers addAll: super typStaInstanceMethodResolvers.
	^ resolvers
]