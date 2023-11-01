Extension { #name : #Behavior }

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodBinaryCompiledMethodAt: aLookup root: anotherLookup [
	<typShaMethod: '>>'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: CompiledMethod typAsType
		arguments: {Symbol typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodKeywordBasicNew: aLookup root: anotherLookup [
	<typShaMethod: 'basicNew:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: anotherLookup self classDescription instanceSide typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodKeywordCanUnderstand: aLookup root: anotherLookup [
	<typShaMethod: 'canUnderstand:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Symbol typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodKeywordCompile: aLookup root: anotherLookup [
	<typShaMethod: 'compile:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Symbol typAsType
		arguments: {String typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodKeywordCompiledMethodAt: aLookup root: anotherLookup [
	<typShaMethod: 'compiledMethodAt:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: CompiledMethod typAsType
		arguments: {Symbol typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodKeywordIncludesBehavior: aLookup root: anotherLookup [
	<typShaMethod: 'includesBehavior:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Behavior typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodKeywordIncludesSelector: aLookup root: anotherLookup [
	<typShaMethod: 'includesSelector:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Symbol typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodKeywordInheritsFrom: aLookup root: anotherLookup [
	<typShaMethod: 'inheritsFrom:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {ClassDescription typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodKeywordLookupSelector: aLookup root: anotherLookup [
	<typShaMethod: 'lookupSelector:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: CompiledMethod typAsType
		arguments: {Symbol typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodKeywordMethodNamed: aLookup root: anotherLookup [
	<typShaMethod: 'methodNamed:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: CompiledMethod typAsType
		arguments: {Symbol typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodKeywordNew: aLookup root: anotherLookup [
	<typShaMethod: 'new:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: anotherLookup self classDescription instanceSide typAsType
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodKeywordWhichClassDefinesClassVar: aLookup root: anotherLookup [
	<typShaMethod: 'whichClassDefinesClassVar:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Class typAsType
		arguments: {String typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodKeywordWhichClassDefinesInstVar: aLookup root: anotherLookup [
	<typShaMethod: 'whichClassDefinesInstVar:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: ClassDescription typAsType
		arguments: {String typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodUnaryAllSubclasses: aLookup root: anotherLookup [
	<typShaMethod: 'allSubclasses'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (OrderedCollection typAsType withParameters: {Behavior typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodUnaryBasicNew: aLookup root: anotherLookup [
	<typShaMethod: 'basicNew'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: anotherLookup self classDescription instanceSide typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodUnaryClassVarNames: aLookup root: anotherLookup [
	<typShaMethod: 'classVarNames'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Set typAsType withParameters: {String typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodUnaryInstVarNames: aLookup root: anotherLookup [
	<typShaMethod: 'instVarNames'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {String typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodUnaryIsAbstract: aLookup root: anotherLookup [
	<typShaMethod: 'isAbstract'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodUnaryMethods: aLookup root: anotherLookup [
	<typShaMethod: 'methods'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Collection typAsType withParameters: {CompiledMethod typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodUnaryName: aLookup root: anotherLookup [
	<typShaMethod: 'name'>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodUnaryNew: aLookup root: anotherLookup [
	<typShaMethod: 'new'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: anotherLookup self classDescription instanceSide typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodUnarySelectors: aLookup root: anotherLookup [
	<typShaMethod: 'selectors'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Collection typAsType withParameters: {Symbol typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodUnarySuperclass: aLookup root: anotherLookup [
	<typShaMethod: 'superclass'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver classDescription superclass classSide typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Behavior >> typShaMethodUnaryWithAllSuperclasses: aLookup root: anotherLookup [
	<typShaMethod: 'withAllSuperclasses'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {ClassDescription typAsType})
]
