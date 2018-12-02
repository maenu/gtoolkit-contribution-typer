Extension { #name : #Association }

{ #category : #'*Typer-Static-Pharo' }
Association class >> typStaInstanceMethodResolvers [
	| resolvers |
	resolvers := OrderedCollection new.
	resolvers
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #key;
				argumentTypes: [ TypNoTypeError signal ];
				resultType: [ :r :a :s | a key parameters at: 1 ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #value;
				argumentTypes: [ TypNoTypeError signal ];
				resultType: [ :r :a :s | a key parameters at: 2 ];
				yourself).
	resolvers addAll: super typStaInstanceMethodResolvers.
	^ resolvers
]
