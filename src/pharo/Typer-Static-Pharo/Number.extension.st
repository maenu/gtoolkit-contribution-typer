Extension { #name : #Number }

{ #category : #'*Typer-Static-Pharo' }
Number class >> typStaInstanceMethodResolvers [
	<typTypeResultAs: 'OrderedCollection<TypMethodResolver>'>
	| resolvers |
	resolvers := OrderedCollection new.	"typParameters TypMethodResolver"
	resolvers
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #timesCollect:;
				argumentTypes: [ BlockClosure typAsType
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
