Class {
	#name : #TypShaPhaBehavior,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaBehavior class >> shadowedClass [
	^ Behavior class
]

{ #category : #shadow }
TypShaPhaBehavior >> mAllSubclasses: aLookup [
	<typShaMethod: 'allSubclasses'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(OrderedCollection typAsType withParameters: {Behavior typAsType})
]

{ #category : #shadow }
TypShaPhaBehavior >> mBinary83: aLookup [
	<typShaMethod: '>>'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: CompiledMethod typAsType
		arguments: {Symbol typAsType}
]

{ #category : #shadow }
TypShaPhaBehavior >> mCanUnderstand: aLookup [
	<typShaMethod: 'canUnderstand:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Symbol typAsType}
]

{ #category : #shadow }
TypShaPhaBehavior >> mClassVarNames: aLookup [
	<typShaMethod: 'classVarNames'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Set typAsType withParameters: {String typAsType})
]

{ #category : #shadow }
TypShaPhaBehavior >> mCompile: aLookup [
	<typShaMethod: 'compile:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Symbol typAsType
		arguments: {String typAsType}
]

{ #category : #shadow }
TypShaPhaBehavior >> mCompiledMethodAt: aLookup [
	<typShaMethod: 'compiledMethodAt:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: CompiledMethod typAsType
		arguments: {Symbol typAsType}
]

{ #category : #shadow }
TypShaPhaBehavior >> mIncludesBehavior: aLookup [
	<typShaMethod: 'includesBehavior:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Behavior typAsType}
]

{ #category : #shadow }
TypShaPhaBehavior >> mIncludesSelector: aLookup [
	<typShaMethod: 'includesSelector:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Symbol typAsType}
]

{ #category : #shadow }
TypShaPhaBehavior >> mInheritsFrom: aLookup [
	<typShaMethod: 'inheritsFrom:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {ClassDescription typAsType}
]

{ #category : #shadow }
TypShaPhaBehavior >> mInstVarNames: aLookup [
	<typShaMethod: 'instVarNames'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				withParameters: {String typAsType})
]

{ #category : #shadow }
TypShaPhaBehavior >> mIsAbstract: aLookup [
	<typShaMethod: 'isAbstract'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaPhaBehavior >> mLookupSelector: aLookup [
	<typShaMethod: 'lookupSelector:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: CompiledMethod typAsType
		arguments: {Symbol typAsType}
]

{ #category : #shadow }
TypShaPhaBehavior >> mMethodNamed: aLookup [
	<typShaMethod: 'methodNamed:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: CompiledMethod typAsType
		arguments: {Symbol typAsType}
]

{ #category : #shadow }
TypShaPhaBehavior >> mMethods: aLookup [
	<typShaMethod: 'methods'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Collection typAsType withParameters: {CompiledMethod typAsType})
]

{ #category : #shadow }
TypShaPhaBehavior >> mName: aLookup [
	<typShaMethod: 'name'>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]

{ #category : #shadow }
TypShaPhaBehavior >> mSelectors: aLookup [
	<typShaMethod: 'selectors'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Collection typAsType withParameters: {Symbol typAsType})
]

{ #category : #shadow }
TypShaPhaBehavior >> mSuperclass: aLookup [
	<typShaMethod: 'superclass'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver classDescription superclass classSide typAsType
]

{ #category : #shadow }
TypShaPhaBehavior >> mWhichClassDefinesClassVar: aLookup [
	<typShaMethod: 'whichClassDefinesClassVar:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Class typAsType
		arguments: {String typAsType}
]

{ #category : #shadow }
TypShaPhaBehavior >> mWhichClassDefinesInstVar: aLookup [
	<typShaMethod: 'whichClassDefinesInstVar:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: ClassDescription typAsType
		arguments: {String typAsType}
]

{ #category : #shadow }
TypShaPhaBehavior >> mWithAllSuperclasses: aLookup [
	<typShaMethod: 'withAllSuperclasses'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				withParameters: {ClassDescription typAsType})
]
