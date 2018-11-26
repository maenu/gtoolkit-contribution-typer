Extension { #name : #Object }

{ #category : #'*Typer-Static-Pharo' }
Object class >> typStaClassMethodResolvers [
	| resolvers |
	resolvers := OrderedCollection new.
	resolvers
		add:
			(TypNonParametricMethodResolver new
				receiverType: self class typAsType;
				selector: #new;
				argumentTypes: {};
				resultType: self typAsType;
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
			(TypNonParametricMethodResolver new
				receiverType: self class typAsType;
				selector: #new;
				argumentTypes: {};
				resultType: self typAsType;
				yourself).
	resolvers addAll: super typStaInstanceMethodResolvers.
	^ resolvers
]
