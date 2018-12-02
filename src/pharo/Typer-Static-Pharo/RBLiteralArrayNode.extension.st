Extension { #name : #RBLiteralArrayNode }

{ #category : #'*Typer-Static-Pharo' }
RBLiteralArrayNode class >> typStaInstanceMethodResolvers [
	<typTypeResultAs: 'OrderedCollection<TypMethodResolver>'>
	| resolvers |
	resolvers := OrderedCollection new "typParameters TypMethodResolver".
	resolvers
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #contents;
				argumentTypes: [ TypNoTypeError signal ];
				resultType: [ OrderedCollection typAsType copy
						parameters: {RBLiteralNode typAsType};
						yourself ];
				yourself).
	resolvers addAll: super typStaInstanceMethodResolvers.
	^ resolvers
]

{ #category : #'*Typer-Static-Pharo' }
RBLiteralArrayNode class >> typStaInstanceVariableResolvers [
	<typTypeResultAs: 'OrderedCollection<TypVariableResolver>'>
	| resolvers |
	resolvers := OrderedCollection new "typParameters TypVariableResolver".
	resolvers
		add:
			(TypVariableResolver new
				receiverType: self typAsType;
				selector: #contents;
				type: [ OrderedCollection typAsType copy
						parameters: {RBLiteralNode typAsType};
						yourself ];
				yourself).
	resolvers addAll: super typStaInstanceVariableResolvers.
	^ resolvers
]
