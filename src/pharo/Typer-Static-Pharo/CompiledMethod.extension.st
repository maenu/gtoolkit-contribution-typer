Extension { #name : #CompiledMethod }

{ #category : #'*Typer-Static-Pharo' }
CompiledMethod class >> typAsType [
	^ TypNamedType new
		name: self name;
		yourself
]

{ #category : #'*Typer-Static-Pharo' }
CompiledMethod class >> typStaInstanceMethodResolvers [
	<typTypeResultAs: 'OrderedCollection<TypMethodResolver>'>
	| resolvers |
	resolvers := OrderedCollection new.	"typParameters TypMethodResolver"
	resolvers
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #pragmas;
				argumentTypes: [ TypNoTypeError signal ];
				resultType: [ OrderedCollection typAsType copy
						parameters: {Pragma typAsType};
						yourself ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #numArgs;
				argumentTypes: [ TypNoTypeError signal ];
				resultType: [ Integer typAsType ];
				yourself).
	resolvers addAll: super typStaInstanceMethodResolvers.
	^ resolvers
]
