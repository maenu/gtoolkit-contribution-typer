Extension { #name : #SequenceableCollection }

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection >> typShaMethodKeywordAtIfAbsent: aLookup root: anotherLookup [
	<typShaMethod: 'at:ifAbsent:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: {aLookup self at: #A.
				(anotherLookup arguments at: 2) result} typAsType
		arguments: {Integer typAsType.
				BlockClosure typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection >> typShaMethodKeywordBeginsWith: aLookup root: anotherLookup [
	<typShaMethod: 'beginsWith:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {aLookup receiver}
]

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection >> typShaMethodKeywordCopyFromTo: aLookup root: anotherLookup [
	<typShaMethod: 'copyFrom:to:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {Integer typAsType.
				Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection >> typShaMethodKeywordDetectIndex: aLookup root: anotherLookup [
	<typShaMethod: 'detectIndex:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {BlockClosure
					typAsFunctionTypeWithResult: Boolean typAsType
					arguments: {aLookup receiver at: #A}}
]

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection >> typShaMethodKeywordEndsWith: aLookup root: anotherLookup [
	<typShaMethod: 'endsWith:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {aLookup receiver}
]

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection >> typShaMethodKeywordIndexOf: aLookup root: anotherLookup [
	<typShaMethod: 'indexOf:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {aLookup receiver at: #A}
]

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection class >> typShaMethodKeywordOfSize: aLookup root: anotherLookup [
	<typShaMethod: 'ofSize:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self classDescription instanceSide typAsType
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection >> typShaMethodKeywordSort: aLookup root: anotherLookup [
	<typShaMethod: 'sort:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {BlockClosure
					typAsFunctionTypeWithResult: Boolean typAsType
					arguments: {aLookup receiver at: #A.
							aLookup receiver at: #A}}
]

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection class >> typShaMethodKeywordStreamContents: aLookup root: anotherLookup [
	<typShaMethod: 'streamContents:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self classDescription instanceSide typAsType
		arguments: {BlockClosure
					typAsFunctionTypeWithResult: TypUnknownType instance
					arguments: {Stream typAsType}}
]

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection >> typShaMethodKeywordWithIndexDo: aLookup root: anotherLookup [
	<typShaMethod: 'withIndexDo:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {BlockClosure
					typAsFunctionTypeWithResult: TypUnknownType instance
					arguments: {aLookup receiver at: #A.
							Integer typAsType}}
]

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection >> typShaMethodKeywordWithIndexSelect: aLookup root: anotherLookup [
	<typShaMethod: 'withIndexSelect:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {BlockClosure
					typAsFunctionTypeWithResult: Boolean typAsType
					arguments: {aLookup receiver at: #A.
							Integer typAsType}}
]

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection >> typShaMethodUnaryFirst: aLookup root: anotherLookup [
	<typShaMethod: 'first'>
	^ CompiledMethod typAsFunctionTypeWithResult: (aLookup receiver at: #A)
]

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection >> typShaMethodUnaryLast: aLookup root: anotherLookup [
	<typShaMethod: 'last'>
	^ CompiledMethod typAsFunctionTypeWithResult: (aLookup receiver at: #A)
]

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection >> typShaMethodUnaryReversed: aLookup root: anotherLookup [
	<typShaMethod: 'reversed'>
	^ CompiledMethod typAsFunctionTypeWithResult: aLookup self
]

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection class >> typShaType: aLookup root: anotherLookup [
	<typShaType>
	^ anotherLookup classDescription
		typAsParametricTypeWithParameters: {#A -> #A typAsVariableType}
]
