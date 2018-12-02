Extension { #name : #SequenceableCollection }

{ #category : #'*Typer-Static-Pharo' }
SequenceableCollection class >> typStaClassMethodResolvers [
	| resolvers |
	resolvers := OrderedCollection new.
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
	| resolvers |
	resolvers := OrderedCollection new.
	resolvers
		add:
			(TypMethodResolver new
				receiverType: self typAsType;
				selector: #withIndexDo:;
				argumentTypes: [ :r :i :a :s | 
					TypParametricType new
						type: BlockClosure typAsType;
						parameters:
							{(a key parameters at: i).
							Integer typAsType.
							a key};
						yourself ];
				resultType: [ :r :a :s | a key ];
				yourself).
	resolvers addAll: super typStaInstanceMethodResolvers.
	^ resolvers
]
