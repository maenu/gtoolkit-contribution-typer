Extension { #name : #SequenceableCollection }

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection >> typShaMethodAt: aLookup [
	<typShaMethod: 'at:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup root receiver at: #A)
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection >> typShaMethodAtIfAbsent: aLookup [
	<typShaMethod: 'at:ifAbsent:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: {aLookup root receiver at: #A.
				(aLookup root arguments at: 2) result} typAsType
		arguments: {Integer typAsType.
				BlockClosure typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection >> typShaMethodBeginsWith: aLookup [
	<typShaMethod: 'beginsWith:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {aLookup receiver}
]

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection >> typShaMethodCopyFromTo: aLookup [
	<typShaMethod: 'copyFrom:to:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {Integer typAsType.
				Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection >> typShaMethodDetectIndex: aLookup [
	<typShaMethod: 'detectIndex:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {BlockClosure
					typAsFunctionTypeWithResult: Boolean typAsType
					arguments: {aLookup receiver at: #A}}
]

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection >> typShaMethodDetectIndexIfNone: aLookup [
	<typShaMethod: 'detectIndex:ifNone:'>
	| a |
	a := aLookup arguments at: 2.
	^ CompiledMethod
		typAsFunctionTypeWithResult: {Integer typAsType.
				a isFunction ifTrue: [ a result ] ifFalse: [ a ]} typAsType
		arguments: {BlockClosure
					typAsFunctionTypeWithResult: Boolean typAsType
					arguments: {aLookup receiver at: #A}.
				{TypUnknownType instance.
					BlockClosure typAsFunctionTypeWithResult: Boolean typAsType} typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection >> typShaMethodEndsWith: aLookup [
	<typShaMethod: 'endsWith:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {aLookup receiver}
]

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection >> typShaMethodFirst: aLookup [
	<typShaMethod: 'first'>
	^ CompiledMethod typAsFunctionTypeWithResult: (aLookup receiver at: #A)
]

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection >> typShaMethodIndexOf: aLookup [
	<typShaMethod: 'indexOf:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {aLookup receiver at: #A}
]

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection >> typShaMethodIsEmpty: aLookup [
	<typShaMethod: 'isEmpty'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection >> typShaMethodLast: aLookup [
	<typShaMethod: 'last'>
	^ CompiledMethod typAsFunctionTypeWithResult: (aLookup receiver at: #A)
]

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection class >> typShaMethodOfSize: aLookup [
	<typShaMethod: 'ofSize:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver classDescription instanceSide typAsType
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection >> typShaMethodReversed: aLookup [
	<typShaMethod: 'reversed'>
	^ CompiledMethod typAsFunctionTypeWithResult: aLookup root receiver
]

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection >> typShaMethodSort: aLookup [
	<typShaMethod: 'sort:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {BlockClosure
					typAsFunctionTypeWithResult: Boolean typAsType
					arguments: {aLookup receiver at: #A.
							aLookup receiver at: #A}}
]

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection class >> typShaMethodStreamContents: aLookup [
	<typShaMethod: 'streamContents:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver classDescription instanceSide typAsType
		arguments: {BlockClosure
					typAsFunctionTypeWithResult: TypUnknownType instance
					arguments: {Stream typAsType}}
]

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection >> typShaMethodWithIndexCollect: aLookup [
	<typShaMethod: 'withIndexCollect:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver withParameters: {(aLookup arguments at: 1) result})
		arguments: {BlockClosure
					typAsFunctionTypeWithResult: TypUnknownType instance
					arguments: {aLookup receiver at: #A.
							Integer typAsType}}
]

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection >> typShaMethodWithIndexDo: aLookup [
	<typShaMethod: 'withIndexDo:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {BlockClosure
					typAsFunctionTypeWithResult: TypUnknownType instance
					arguments: {aLookup receiver at: #A.
							Integer typAsType}}
]

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection >> typShaMethodWithIndexSelect: aLookup [
	<typShaMethod: 'withIndexSelect:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {BlockClosure
					typAsFunctionTypeWithResult: Boolean typAsType
					arguments: {aLookup receiver at: #A.
							Integer typAsType}}
]

{ #category : #'*Typer-Shadow-Pharo' }
SequenceableCollection class >> typShaType: aLookup [
	<typShaType>
	^ aLookup root classDescription
		typAsParametricTypeWithParameters: {#A -> #A typAsVariableType} asOrderedDictionary
]
