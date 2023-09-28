Class {
	#name : #TypDynPackageOnly,
	#superclass : #Object,
	#instVars : [
		'package',
		'methods'
	],
	#category : #'Typer-Dynamic-Core'
}

{ #category : #'reflective operations' }
TypDynPackageOnly >> doesNotUnderstand: aMessage [

	"not my problem"

	^ aMessage sendTo: package
]

{ #category : #accessing }
TypDynPackageOnly >> methods [

	^ methods
]

{ #category : #accessing }
TypDynPackageOnly >> methods: anObject [

	methods := anObject
]

{ #category : #accessing }
TypDynPackageOnly >> package [

	^ package
]

{ #category : #accessing }
TypDynPackageOnly >> package: anObject [

	package := anObject
]
