Extension { #name : #SequenceableCollection }

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection >> typShaMethodKeywordAtIfAbsent: aLookup [
	<typShaMethod: 'at:ifAbsent:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: {aLookup self at: #A.
				(aLookup root arguments at: 2) result} typAsType
		arguments: {Integer typAsType.
				BlockClosure typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection >> typShaMethodKeywordBeginsWith: aLookup [
	<typShaMethod: 'beginsWith:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {aLookup receiver}
]

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection >> typShaMethodKeywordCopyFromTo: aLookup [
	<typShaMethod: 'copyFrom:to:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {Integer typAsType.
				Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection >> typShaMethodKeywordDetectIndex: aLookup [
	<typShaMethod: 'detectIndex:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {BlockClosure
					typAsFunctionTypeWithResult: Boolean typAsType
					arguments: {aLookup receiver at: #A}}
]

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection >> typShaMethodKeywordEndsWith: aLookup [
	<typShaMethod: 'endsWith:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {aLookup receiver}
]

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection >> typShaMethodKeywordIndexOf: aLookup [
	<typShaMethod: 'indexOf:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {aLookup receiver at: #A}
]

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection class >> typShaMethodKeywordOfSize: aLookup [
	<typShaMethod: 'ofSize:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self classDescription instanceSide typAsType
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection >> typShaMethodKeywordSort: aLookup [
	<typShaMethod: 'sort:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {BlockClosure
					typAsFunctionTypeWithResult: Boolean typAsType
					arguments: {aLookup receiver at: #A.
							aLookup receiver at: #A}}
]

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection class >> typShaMethodKeywordStreamContents: aLookup [
	<typShaMethod: 'streamContents:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self classDescription instanceSide typAsType
		arguments: {BlockClosure
					typAsFunctionTypeWithResult: TypUnknownType instance
					arguments: {Stream typAsType}}
]

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection >> typShaMethodKeywordWithIndexDo: aLookup [
	<typShaMethod: 'withIndexDo:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {BlockClosure
					typAsFunctionTypeWithResult: TypUnknownType instance
					arguments: {aLookup receiver at: #A.
							Integer typAsType}}
]

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection >> typShaMethodKeywordWithIndexSelect: aLookup [
	<typShaMethod: 'withIndexSelect:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {BlockClosure
					typAsFunctionTypeWithResult: Boolean typAsType
					arguments: {aLookup receiver at: #A.
							Integer typAsType}}
]

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection >> typShaMethodUnaryFirst: aLookup [
	<typShaMethod: 'first'>
	^ CompiledMethod typAsFunctionTypeWithResult: (aLookup receiver at: #A)
]

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection >> typShaMethodUnaryLast: aLookup [
	<typShaMethod: 'last'>
	^ CompiledMethod typAsFunctionTypeWithResult: (aLookup receiver at: #A)
]

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection >> typShaMethodUnaryReversed: aLookup [
	<typShaMethod: 'reversed'>
	^ CompiledMethod typAsFunctionTypeWithResult: aLookup self
]

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection class >> typShaType: aLookup [
	<typShaType>
	^ aLookup root classDescription
		typAsParametricTypeWithParameters: {#A -> #A typAsVariableType} asOrderedDictionary
]
