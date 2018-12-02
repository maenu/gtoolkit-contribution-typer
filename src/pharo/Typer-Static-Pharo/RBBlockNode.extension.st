Extension { #name : #RBBlockNode }

{ #category : #'*Typer-Static-Pharo' }
RBBlockNode class >> typStaInstanceVariableResolvers [
	<typTypeResultAs: 'OrderedCollection<TypVariableResolver>'>
	| resolvers |
	resolvers := OrderedCollection new "typParameters TypVariableResolver".
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
