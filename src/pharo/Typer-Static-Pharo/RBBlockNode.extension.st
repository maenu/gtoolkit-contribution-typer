Extension { #name : #RBBlockNode }

{ #category : #'*Typer-Static-Pharo' }
RBBlockNode class >> typStaInstanceVariableResolvers [
	| resolvers |
	resolvers := OrderedCollection new.
	resolvers
		add:
			(TypVariableResolver new
				receiverType: self typAsType;
				selector: #arguments;
				type: [ OrderedCollection typAsType copy
						parameters: {RBArgumentNode typAsType};
						yourself ];
				yourself).
	resolvers addAll: super typStaInstanceVariableResolvers.
	^ resolvers
]
