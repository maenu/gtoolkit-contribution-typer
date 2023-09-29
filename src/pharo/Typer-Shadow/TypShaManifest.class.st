Class {
	#name : #TypShaManifest,
	#superclass : #PackageManifest,
	#category : #'Typer-Shadow-Core'
}

{ #category : #accessing }
TypShaManifest class >> build [
	TypShaIndex instance
]

{ #category : #accessing }
TypShaManifest class >> invalidate [
	TypShaIndex invalidate
]
