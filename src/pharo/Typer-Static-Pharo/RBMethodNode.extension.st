Extension { #name : #RBMethodNode }

{ #category : #'*Typer-Static-Pharo' }
RBMethodNode class >> typStaInstanceMethodResolvers [
	<typTypeResultAs: 'OrderedCollection<TypMethodResolver>'>
	| resolvers |
	resolvers := OrderedCollection new "typParameters TypMethodResolver".
	resolvers
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #arguments;
				argumentTypes: [ TypNoTypeError signal ];
				resultType: [ OrderedCollection typAsType copy
						parameters: {RBArgumentNode typAsType};
						yourself ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #methodClass;
				argumentTypes: [ TypNoTypeError signal ];
				resultType: [ ClassDescription typAsType ];
				yourself).
	resolvers addAll: super typStaInstanceMethodResolvers.
	^ resolvers
]

{ #category : #'*Typer-Static-Pharo' }
RBMethodNode class >> typStaInstanceVariableResolvers [
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
