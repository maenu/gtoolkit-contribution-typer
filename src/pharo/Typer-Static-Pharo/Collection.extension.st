Extension { #name : #Collection }

{ #category : #'*Typer-Static-Pharo' }
Collection class >> typStaClassMethodResolvers [
	| resolvers |
	resolvers := OrderedCollection new.
	resolvers
		add:
			(TypMethodResolver new
				receiverType: self class typAsType;
				selector: #new;
				argumentTypes: [ {} ];
				resultType: [ :r :a :s | 
					TypParametricType new
						type: self typAsType;
						parameters: {TypUnknownType instance};
						yourself ];
				yourself).
	resolvers addAll: super typStaInstanceMethodResolvers.
	^ resolvers
]

{ #category : #'*Typer-Static-Pharo' }
Collection class >> typStaInstanceMethodResolvers [
	| resolvers |
	resolvers := OrderedCollection new.
	resolvers
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #do:;
				argumentTypes: [ :r :i :a :s | 
					a key isParametric
						ifTrue: [ TypParametricType new
								type: BlockClosure typAsType;
								parameters:
									{(a key parameters at: i).
									a key};
								yourself ]
						ifFalse: [ a value key ] ];
				resultType: [ :r :a :s | a key ];
				yourself).
	resolvers addAll: super typStaInstanceMethodResolvers.
	^ resolvers
]
