Extension { #name : #SequenceableCollection }

{ #category : #'*Typer-Static-Pharo' }
SequenceableCollection class >> typStaClassMethodResolvers [
	<typTypeResultAs: 'OrderedCollection<TypMethodResolver>'>
	| resolvers |
	resolvers := OrderedCollection new "typParameters TypMethodResolver".
	resolvers
		add:
			(TypMethodResolver new
				receiverType: self class typAsType;
				selector: #ofSize:;
				argumentTypes: [ Integer typAsType ];
				resultType: [ self typAsType ];
				yourself).
	resolvers addAll: super typStaClassMethodResolvers.
	^ resolvers
]

{ #category : #'*Typer-Static-Pharo' }
SequenceableCollection class >> typStaInstanceMethodResolvers [
	<typTypeResultAs: 'OrderedCollection<TypMethodResolver>'>
	| resolvers |
	resolvers := OrderedCollection new "typParameters TypMethodResolver".
	resolvers
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #withIndexDo:;
				argumentTypes: [ :r :i :a | 
					TypParametricType new
						type: BlockClosure typAsType asNonParametricType;
						parameters:
							{(a receiverType parameters at: i).
							Integer typAsType.
							a receiverType};
						yourself ];
				resultType: [ :r :a | a receiverType ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #detectIndex:;
				argumentTypes: [ :r :i :a | 
					TypParametricType new
						type: BlockClosure typAsType asNonParametricType;
						parameters:
							{(a receiverType parameters at: i).
							Boolean typAsType};
						yourself ];
				resultType: [ Integer typAsType ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #copyFrom:to:;
				argumentTypes: [ Integer typAsType ];
				resultType: [ :r :a | a receiverType ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #at:;
				argumentTypes: [ Integer typAsType ];
				resultType: [ :r :a | a receiverType parameters at: 1 ];
				yourself);
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #last;
				argumentTypes: [ TypNoTypeError signal ];
				resultType: [ :r :a | a receiverType parameters at: 1 ];
				yourself).
	resolvers addAll: super typStaInstanceMethodResolvers.
	^ resolvers
]
