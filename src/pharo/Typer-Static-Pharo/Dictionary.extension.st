Extension { #name : #Dictionary }

{ #category : #'*Typer-Static-Pharo' }
Dictionary class >> typAsType [
	^ TypParametricType new
		type: super typAsType asNonParametricType;
		parameters:
			{TypUnknownType instance.
			TypUnknownType instance};
		yourself
]

{ #category : #'*Typer-Static-Pharo' }
Dictionary class >> typStaInstanceMethodResolvers [
	| resolvers |
	resolvers := OrderedCollection new.
	resolvers
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #at:put:;
				argumentTypes: [ :r :i :a :s | a key parameters at: i ];
				resultType: [ :r :a :s | a key parameters at: 2 ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #at:ifAbsentPut:;
				argumentTypes: [ :r :i :a :s | 
					i = 1
						ifTrue: [ a key parameters at: 1 ]
						ifFalse: [ TypParametricType new
								type: BlockClosure typAsType;
								parameters: {(a key parameters at: 2)};
								yourself ] ];
				resultType: [ :r :a :s | a key parameters at: 2 ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #associations;
				argumentTypes: [ TypNoTypeError signal ];
				resultType: [ :r :a | 
					TypParametricType new
						type: Collection typAsType asNonParametricType;
						parameters:
							{(TypParametricType new
								type: Association typAsType asNonParametricType;
								parameters:
									{(a key parameters at: 1).
									(a key parameters at: 2)};
								yourself)};
						yourself ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #associationsDo:;
				argumentTypes: [ :r :i :a | 
					TypParametricType new
						type: BlockClosure typAsType;
						parameters:
							{(TypParametricType new
								type: Association typAsType asNonParametricType;
								parameters:
									{(a key parameters at: 1).
									(a key parameters at: 2)};
								yourself).
							TypUnknownType instance};
						yourself ];
				resultType: [ :r :a :s | a key ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #keys;
				argumentTypes: [ TypNoTypeError signal ];
				resultType: [ :r :a :s | 
					TypParametricType new
						type: Set typAsType asNonParametricType;
						parameters: {(a key parameters at: 1)};
						yourself ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #anyOne;
				argumentTypes: [ TypNoTypeError signal ];
				resultType: [ :r :a | a key parameters at: 2 ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #includes:;
				argumentTypes: [ :r :i :a | a key parameters at: 2 ];
				resultType: [ Boolean typAsType ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #includesKey:;
				argumentTypes: [ :r :i :a | a key parameters at: 1 ];
				resultType: [ Boolean typAsType ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #asOrderedDictionary;
				argumentTypes: [ TypNoTypeError signal ];
				resultType: [ :r :a | 
					TypParametricType new
						type: OrderedDictionary typAsType asNonParametricType;
						parameters:
							{(a key parameters at: 1).
							(a key parameters at: 2)};
						yourself ];
				yourself).
	resolvers addAll: super typStaInstanceMethodResolvers.
	^ resolvers
]
