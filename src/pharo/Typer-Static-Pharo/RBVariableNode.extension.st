Extension { #name : #RBVariableNode }

{ #category : #'*Typer-Static-Pharo' }
RBVariableNode class >> typStaInstanceMethodResolvers [
	| resolvers |
	resolvers := OrderedCollection new.
	resolvers
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #binding;
				argumentTypes: [ TypNoTypeError signal ];
				resultType: [ OCLiteralVariable typAsType ];
				yourself).
	resolvers addAll: super typStaInstanceMethodResolvers.
	^ resolvers
]
