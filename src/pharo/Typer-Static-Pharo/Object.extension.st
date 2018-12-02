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
				argumentTypes: [ TypNoTypeError signal ];
				resultType: [ self typAsType ];
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
				argumentTypes: [ TypNoTypeError signal ];
				resultType: [ :r :a | a key ];
				yourself).
	resolvers
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #copy;
				argumentTypes: [ TypNoTypeError signal ];
				resultType: [ :r :a | a key ];
				yourself).
	resolvers addAll: super typStaInstanceMethodResolvers.
	^ resolvers
]
