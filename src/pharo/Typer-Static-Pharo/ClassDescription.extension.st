Extension { #name : #ClassDescription }

{ #category : #'*Typer-Static-Pharo' }
ClassDescription class >> typStaInstanceMethodResolvers [
	<typTypeResultAs: 'OrderedCollection<TypMethodResolver>'>
	| resolvers |
	resolvers := OrderedCollection new.	"typParameters TypMethodResolver"
	resolvers
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #lookupSelector:;
				argumentTypes: [ Symbol typAsType ];
				resultType: [ CompiledMethod typAsType ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #methods;
				argumentTypes: [ TypNoTypeError signal ];
				resultType: [ Collection typAsType copy
						parameters: {CompiledMethod typAsType};
						yourself ];
				yourself).
	resolvers addAll: super typStaInstanceMethodResolvers.
	^ resolvers
]
