Extension { #name : #Object }

{ #category : #'*Typer-Static-Pharo' }
Object class >> typStaClassMethodResolvers [
	| resolvers |
	resolvers := OrderedCollection new.
	resolvers
		add:
			(TypMethodResolver new
				receiverType: self class typAsType;
				selector: #new;
				argumentTypes: [ {} ];
				resultType: [ :r :a | self typAsType ];
				yourself).
	resolvers addAll: super typStaInstanceMethodResolvers.
	^ resolvers
]

{ #category : #'*Typer-Static-Pharo' }
Object class >> typStaInstanceMethodResolvers [
	| resolvers |
	resolvers := OrderedCollection new.
	resolvers
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #yourself;
				argumentTypes: [ {} ];
				resultType: [ self typAsType ];
				yourself).
	resolvers addAll: super typStaInstanceMethodResolvers.
	^ resolvers
]
