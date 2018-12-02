Extension { #name : #OCLiteralVariable }

{ #category : #'*Typer-Static-Pharo' }
OCLiteralVariable class >> typStaInstanceMethodResolvers [
	<typTypeResultAs: 'OrderedCollection<TypMethodResolver>'>
	| resolvers |
	resolvers := OrderedCollection new "typParameters TypMethodResolver".
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
