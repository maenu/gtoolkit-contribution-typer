Extension { #name : #Number }

{ #category : #'*Typer-Static-Pharo' }
Number class >> typStaInstanceMethodResolvers [
	| resolvers |
	resolvers := OrderedCollection new.
	resolvers
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #timesCollect:;
				argumentTypes: [ :r :i :a | 
					BlockClosure typAsType
						asParametricType:
							{Integer typAsType.
							TypUnknownType instance} ];
				resultType: [ OrderedCollection typAsType copy
						asParametricType: {TypUnknownType instance};
						yourself ];
				yourself).
	resolvers addAll: super typStaInstanceMethodResolvers.
	^ resolvers
]
