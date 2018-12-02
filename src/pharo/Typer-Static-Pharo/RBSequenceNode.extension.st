Extension { #name : #RBSequenceNode }

{ #category : #'*Typer-Static-Pharo' }
RBSequenceNode class >> typStaInstanceVariableResolvers [
	<typTypeResultAs: 'OrderedCollection<TypVariableResolver>'>
	| resolvers |
	resolvers := OrderedCollection new "typParameters TypVariableResolver".
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
