Extension { #name : #RBProgramNode }

{ #category : #'*Typer-Static-Pharo' }
RBProgramNode class >> typStaInstanceMethodResolvers [
	| resolvers |
	resolvers := OrderedCollection new.
	resolvers
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #comments;
				argumentTypes: [ TypNoTypeError signal ];
				resultType: [ OrderedCollection typAsType copy
						parameters: {RBComment typAsType};
						yourself ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #methodNode;
				argumentTypes: [ TypNoTypeError signal ];
				resultType: [ RBMethodNode typAsType ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #assignmentNodes;
				argumentTypes: [ TypNoTypeError signal ];
				resultType: [ OrderedCollection typAsType copy
						parameters: {RBAssignmentNode typAsType};
						yourself ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #whoDefines:;
				argumentTypes: [ String typAsType ];
				resultType: [ RBProgramNode typAsType copy
						nullable: true;
						yourself ];
				yourself).
	resolvers addAll: super typStaInstanceMethodResolvers.
	^ resolvers
]
