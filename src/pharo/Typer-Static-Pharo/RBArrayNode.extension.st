Extension { #name : #RBArrayNode }

{ #category : #'*Typer-Static-Pharo' }
RBArrayNode class >> typStaInstanceVariableResolvers [
	| resolvers |
	resolvers := OrderedCollection new.
	resolvers
		add:
			(TypVariableResolver new
				receiverType: self typAsType;
				selector: #statements;
				type: [ OrderedCollection typAsType copy
						parameters: {RBProgramNode typAsType};
						yourself ];
				yourself).
	resolvers addAll: super typStaInstanceVariableResolvers.
	^ resolvers
]
