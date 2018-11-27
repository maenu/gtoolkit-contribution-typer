Extension { #name : #Collection }

{ #category : #'*Typer-Static-Pharo' }
Collection class >> typStaInstanceMethodResolvers [
	| resolvers |
	resolvers := OrderedCollection new.
	resolvers
		add:
			(TypParametricMethodResolver new
				receiverType: self typAsType;
				selector: #do:;
				argumentTypes: [ :r :i :a :s | 
					a key isParametric
						ifTrue: [ a key parameters at: i ]
						ifFalse: [ a value key ] ];
				resultType: [ :r :a :s | a key ];
				yourself).
	resolvers addAll: super typStaInstanceMethodResolvers.
	^ resolvers
]
