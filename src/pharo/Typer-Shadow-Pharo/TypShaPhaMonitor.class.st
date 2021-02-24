Class {
	#name : #TypShaPhaMonitor,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaMonitor class >> shadowedClass [
	^ Monitor class
]

{ #category : #shadow }
TypShaPhaMonitor >> mCritical: aLookup [
	<typShaMethod: 'critical:'>
	^ TypFunctionType new
		argumentTypes:
				[ :i :a :s :r | BlockClosure typAsFunctionTypeWithResult: TypUnknownType new ];
		resultType: [ :a :s :r | (a argumentTypes at: 1) result ];
		yourself
]
