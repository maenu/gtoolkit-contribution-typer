Extension { #name : #Behavior }

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodBinaryCompiledMethodAt: aLookup [
	<typShaMethod: '>>'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: CompiledMethod typAsType
		arguments: {Symbol typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodKeywordBasicNew: aLookup [
	<typShaMethod: 'basicNew:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root self classDescription instanceSide typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodKeywordCanUnderstand: aLookup [
	<typShaMethod: 'canUnderstand:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Symbol typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodKeywordCompile: aLookup [
	<typShaMethod: 'compile:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Symbol typAsType
		arguments: {String typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodKeywordCompiledMethodAt: aLookup [
	<typShaMethod: 'compiledMethodAt:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: CompiledMethod typAsType
		arguments: {Symbol typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodKeywordIncludesBehavior: aLookup [
	<typShaMethod: 'includesBehavior:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Behavior typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodKeywordIncludesSelector: aLookup [
	<typShaMethod: 'includesSelector:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Symbol typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodKeywordInheritsFrom: aLookup [
	<typShaMethod: 'inheritsFrom:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {ClassDescription typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodKeywordLookupSelector: aLookup [
	<typShaMethod: 'lookupSelector:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: CompiledMethod typAsType
		arguments: {Symbol typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodKeywordMethodNamed: aLookup [
	<typShaMethod: 'methodNamed:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: CompiledMethod typAsType
		arguments: {Symbol typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodKeywordNew: aLookup [
	<typShaMethod: 'new:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root self classDescription instanceSide typAsType
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodKeywordWhichClassDefinesClassVar: aLookup [
	<typShaMethod: 'whichClassDefinesClassVar:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Class typAsType
		arguments: {String typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodKeywordWhichClassDefinesInstVar: aLookup [
	<typShaMethod: 'whichClassDefinesInstVar:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: ClassDescription typAsType
		arguments: {String typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodUnaryAllSubclasses: aLookup [
	<typShaMethod: 'allSubclasses'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (OrderedCollection typAsType withParameters: {Behavior typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodUnaryBasicNew: aLookup [
	<typShaMethod: 'basicNew'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root self classDescription instanceSide typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodUnaryClassVarNames: aLookup [
	<typShaMethod: 'classVarNames'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Set typAsType withParameters: {String typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodUnaryInstVarNames: aLookup [
	<typShaMethod: 'instVarNames'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {String typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodUnaryIsAbstract: aLookup [
	<typShaMethod: 'isAbstract'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodUnaryMethods: aLookup [
	<typShaMethod: 'methods'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Collection typAsType withParameters: {CompiledMethod typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodUnaryName: aLookup [
	<typShaMethod: 'name'>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodUnaryNew: aLookup [
	<typShaMethod: 'new'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root self classDescription instanceSide typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodUnarySelectors: aLookup [
	<typShaMethod: 'selectors'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Collection typAsType withParameters: {Symbol typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodUnarySuperclass: aLookup [
	<typShaMethod: 'superclass'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver classDescription superclass classSide typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodUnaryWithAllSuperclasses: aLookup [
	<typShaMethod: 'withAllSuperclasses'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {ClassDescription typAsType})
]
