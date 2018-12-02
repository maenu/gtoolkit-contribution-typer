Extension { #name : #OCLiteralVariable }

{ #category : #'*Typer-Static-Pharo' }
OCLiteralVariable class >> typStaInstanceMethodResolvers [
	| resolvers |
	resolvers := OrderedCollection new.
	resolvers
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #isGlobalClassNameBinding;
				argumentTypes: [ TypNoTypeError signal ];
				resultType: [ Boolean typAsType ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #isGlobalVariable;
				argumentTypes: [ TypNoTypeError signal ];
				resultType: [ Boolean typAsType ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #isClassVariable;
				argumentTypes: [ TypNoTypeError signal ];
				resultType: [ Boolean typAsType ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #isFromSharedPool;
				argumentTypes: [ TypNoTypeError signal ];
				resultType: [ Boolean typAsType ];
				yourself).
	resolvers addAll: super typStaInstanceMethodResolvers.
	^ resolvers
]
