Extension { #name : #ClassDescription }

{ #category : #'*Typer-Static-Pharo' }
ClassDescription class >> typStaInstanceMethodResolvers [
	| resolvers |
	resolvers := OrderedCollection new.
	resolvers
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #lookupSelector:;
				argumentTypes: [ Symbol typAsType ];
				resultType: [ CompiledMethod typAsType ];
				yourself).
	resolvers addAll: super typStaInstanceMethodResolvers.
	^ resolvers
]
