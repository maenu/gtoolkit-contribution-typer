Extension { #name : #RBMessageNode }

{ #category : #'*Typer-Static-Pharo' }
RBMessageNode class >> typStaInstanceMethodResolvers [
	| resolvers |
	resolvers := OrderedCollection new.
	resolvers
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #arguments;
				argumentTypes: [ TypNoTypeError signal ];
				resultType: [ OrderedCollection typAsType copy
						parameters: {RBValueNode typAsType};
						yourself ];
				yourself).
	resolvers addAll: super typStaInstanceMethodResolvers.
	^ resolvers
]

{ #category : #'*Typer-Static-Pharo' }
RBMessageNode class >> typStaInstanceVariableResolvers [
	| resolvers |
	resolvers := OrderedCollection new.
	resolvers
		add:
			(TypVariableResolver new
				receiverType: self typAsType;
				selector: #arguments;
				type: [ OrderedCollection typAsType copy
						parameters: {RBValueNode typAsType};
						yourself ];
				yourself).
	resolvers addAll: super typStaInstanceVariableResolvers.
	^ resolvers
]
