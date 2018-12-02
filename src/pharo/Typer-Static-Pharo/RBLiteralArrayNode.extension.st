Extension { #name : #RBLiteralArrayNode }

{ #category : #'*Typer-Static-Pharo' }
RBLiteralArrayNode class >> typStaInstanceMethodResolvers [
	| resolvers |
	resolvers := OrderedCollection new.
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
	| resolvers |
	resolvers := OrderedCollection new.
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
